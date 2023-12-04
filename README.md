# Nextcloud Installer for Raspberry Pi

This Bash script automates the installation of Nextcloud on a Raspberry Pi. It takes care of updating the system, installing required packages, configuring Apache, and setting up the MySQL database for Nextcloud.

## Usage

1. Make sure you are running the script as root:

    ```bash
    sudo ./Installer.sh
    ```

2. Follow the on-screen prompts.

## Prerequisites

- Raspberry Pi running a Debian-based operating system.
- Internet connection for downloading Nextcloud and required packages.

## Installation Steps

1. **Update System:**

   The script updates the system to ensure that you have the latest package information.

2. **Install Packages:**

   Installs essential packages such as Apache, MariaDB, and PHP modules required by Nextcloud.

3. **Restart Apache:**

   Restarts the Apache web server to apply the changes.

4. **Download and Extract Nextcloud:**

   Downloads the latest version of Nextcloud from the official website and extracts it to the appropriate directory.

5. **Set Up MySQL Database:**

   Prompts the user for the MySQL password, creates a Nextcloud database, and grants necessary privileges to the Nextcloud user.

6. **Success Message:**

   Displays a success message along with the location of the Nextcloud installation.

## Notes

- The script assumes that it is running on a Raspberry Pi with root privileges.
- Ensure that you have a backup of your data and configurations before running the script.
- Follow security best practices, such as using strong passwords and keeping your system updated.

## Contributing

Feel free to contribute to this project by submitting issues or pull requests.

## License

This script is licensed under the [GNU General Public License (GNU GPL)](LICENSE).

