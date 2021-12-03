import argparse
import os, sys
import logging
import re


DEFAULT_VUE = '''<template>
    <h1>UnIqUe_nAmE</h1>
</template>

<script>
    console.log("UnIqUe_nAmE was here.");  // If you want to use JavaScript, perhaps for animations, add it here.
</script>

<style scoped>
    h1 {
        color: green
    }
</style>

'''

DEFAULT_IMPORT = "import UnIqUe_nAmE from '../views/people/UnIqUe_nAmE.vue'\n"
DEFAULT_ROUTE = """  {
    path: "/members/UnIqUe_nAmE",
    name: "UnIqUe_nAmE",
    component: UnIqUe_nAmE
  },

"""

if __name__ == "__main__":
    logger = logging.getLogger(__name__)
    logging.basicConfig(
        format="%(asctime)s: %(message)s",
        datefmt="%m/%d/%Y %H:%M:%S",
        level=logging.INFO,
    )

    parser = argparse.ArgumentParser(description="Add new member subpage.")
    parser.add_argument("first_name", help="First Name - Ex: Andrew")
    parser.add_argument("last_name", help="Last Name - Ex: Boyer")
    args = parser.parse_args()

    parent_dir = os.path.dirname(os.path.realpath(__file__))
    component_dir = os.path.join(parent_dir, "views/people/")
    try:
        assert os.path.isdir(component_dir), f"Unexpected folder structure. Expected {component_dir} to exist."
        existing_files = os.listdir(component_dir)
        for existing_file in existing_files:
            file_extension = os.path.splitext(existing_file)[-1].lower()
            assert file_extension == ".vue", f"Unexpected file/folder {existing_file}. " \
                                             f"Please make sure that only `.vue` files exist in {component_dir}"
        for name in [args.first_name, args.last_name]:
            assert re.sub("[.\-']", "", name).isalpha(), "Invalid character in name."

    except AssertionError as e:
        logger.warning("An error occurred. Ask a CS club member if you need help.")
        logger.warning(f"ERROR MESSAGE: {e}")
        sys.exit(1)

    username = args.first_name[0].lower() + args.last_name.lower()
    if os.path.isfile(f"{component_dir}{username}.vue"):
        logger.warning("SCRIPT EXITED EARLY.")
        logger.warning(f"{component_dir}{username}.vue already exists. "
                       "To ensure that this script does not overwrite your existing work, "
                       f"please delete {component_dir}{username}.vue and rerun this Python script.")
        sys.exit(0)

    with open(f"{component_dir}{username}.vue", "w") as f:
        custom_vue = DEFAULT_VUE.replace("UnIqUe_nAmE", f"{args.first_name} {args.last_name}")
        f.write(custom_vue)

    with open(os.path.join(parent_dir, "router/index.js"), "r+") as f:
        lines = f.readlines()
        try:
            assert not any(username in line for line in lines), \
                f"{os.path.join(parent_dir, 'router/index.js')} already contains {username}. " \
                f"Please revert {os.path.join(parent_dir, 'router/index.js')}."

            import_code = DEFAULT_IMPORT.replace("UnIqUe_nAmE", username)
            route_code = DEFAULT_ROUTE.replace("UnIqUe_nAmE", username)

            import_index = lines.index('// End import\n')
            lines.insert(import_index, import_code)
            route_index = lines.index('  // End routes\n')
            lines.insert(route_index, route_code)

            # Clear index.js
            f.seek(0)
            f.truncate()
            f.writelines(lines)

        except (AssertionError, ValueError) as e:
            logger.warning("An error occurred. Ask a CS club member if you need help.")
            logger.warning(f"One likely cause is that {os.path.join(parent_dir, 'router/index.js')} was modified.")
            logger.warning(f"ERROR MESSAGE: {e}")
            sys.exit(1)
