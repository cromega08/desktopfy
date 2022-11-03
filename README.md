# desktopfy

A bash script to add shortcuts to executable files in linux OS.

## Installation

### Download

Clone the repo in your machine or copy the code inside the "desktopfy.sh" file.

### Set global access

If want to execute globally in your machine, rename the file and remove the ".sh" in the filename:

```bash
mv path_to_file/desktopfy.sh path_to_file/desktopfy
```

Then, move the new file inside the binaries location in your machine. Recommended to move inside" ~/.local/bin":

```bash
mv path_to_file/desktopfy ~/.local/bin
```

## Usage/Examples

### Usage

1. Access

	First of all, need to see how to access the script in your machine.

	1.1. Global Access

    If configured global access (inside a bin dir) as explained in the installation tutorial, then just call:

    ```bash
    desktopfy
    ```

	1.2. Local Access

    To call, move inside the file containing the script and call using:

    ```bash
    mv /path/to/script
    ```

    ```bash
    ./desktopfy.sh
    ```

    Or just call using the absolute path:

    ```bash
    /path/to/script/desktopfy.sh
    ```

2. Arguments

	desktopfy need 4 positional arguments to work:

	* Name (-n): The name of the applications.

  		- For multiple word, wrap inside "" ("some thing").

  		- Avoid use of special characters, only use letters ([a-z]|[A-Z]), numbers ([0-9]) and space (" ").

	* Executable (-e): The path to the executable.

  		- Recommend the use of the absolute path ("/the/complet/path/to/file.AppImage").

		- Recommend the use of ".AppImage" files.

		- If only filename is used, the script gonna complete with the working dir.

	* Icon (-i): The path to the image thumbnail.

		* Recommend the use of the absolute path ("/the/complete/path/to/image.ico").

		* Recommend the use of ".ico" files.

		* If only filename is used, the script gonna complete with the working dir.

	* Terminal (-t): Indicates if terminal showed when executing.

		* Only "true" of "false" string arguments are allowed.

		* Raise "Error" any other input.

### Examples

The examples will be of a process to add a shortcut to "Balena Etcher".

1. Common case

```bash
desktopfy -n balena -e ~/balena_etcher/etcher/balenaEtcher-1.7.8-x64.AppImage -i ~/balena_etcher/etcher/etcher.ico -t false
```

```bash
Creating "balena" as balena.desktop
"balena" was created as balena.desktop
```

2. Multiple words name

```bash
desktopfy -n "balena etcher" -e ~/balena_etcher/etcher/balenaEtcher-1.7.8-x64.AppImage -i ~/balena_etcher/etcher/etcher.ico -t false
```

```bash
Creating "balena etcher" as "balena_etcher.desktop"
"balena etcher" was created as "balena_etcher.desktop"
```

3. Relative files

```bash
mv ~/balena_etcher/etcher
```

```bash
desktopfy -n "balena etcher" -e balenaEtcher-1.7.8-x64.AppImage -i etcher.ico -t false
```

```bash
Creating "balena etcher" as "balena_etcher.desktop"
"balena etcher" was created as "balena_etcher.desktop"
```

4. Using capitals letters and\or numbers

```bash
desktopfy -n "BaleNa 2etcher" -e ~/balena_etcher/etcher/balenaEtcher-1.7.8-x64.AppImage -i ~/balena_etcher/etcher/etcher.ico -t false
```

```bash
Creating "BaleNa 2etcher" as "balena_2etcher.desktop"
"BaleNa 2etcher" was created as "balena_2etcher.desktop"
```

5. Overwriting existing file

```bash
desktopfy -n "balena etcher" -e ~/balena_etcher/etcher/balenaEtcher-1.7.8-x64.AppImage -i ~/balena_etcher/etcher/etcher.ico -t false
```

* No ("n"):

    ```bash
    Creating "balena etcher" "as balena_etch.desktop"
    "balena_etch.desktop" already exists among the shortcuts, do you want to overwrite file? [y/n]: n

    Stoping process
    ```

* Yes ("y"):

    ```bash
    Creating "balena etcher" as "balena_etch.desktop"
    "balena_etch.desktop" already exists among the shortcuts, do you want to overwrite file? [y/n]: y
    "balena etcher" was created as "balena_etcher.desktop"
    ```

6. Error: Invalid name argument

```bash
desktopfy -n "balena_etcher" -e ~/balena_etcher/etcher/balenaEtcher-1.7.8-x64.AppImage -i ~/balena_etcher/etcher/etcher.ico -t invalidArgument
```

```bash
Error: Invalid name "balena_etcher"

Usage: desktopfy [-n <programm_name>] [-e <executable_path>] [-i <icon_path>] [-t <true|false>]

        -n      Name of the program, for multiple words need to start and end with "" (ex. "some thing")
                (Avoid the use of special characters as *, / or others similar)

        -e      Path to the .AppImage, .bin or executable file gonna be used for execution
                (If only name is provided, the current dir gonna be used as parent)

        -i      Path to the .ico, .png or other image file that gonna be used for icon
                (If only name is provided, the current dir gonna be used as parent)

        -t      Declare if the terminal it's gonna be showed when executing the program
                (Only "true" or "false" arguments are accepted)
```

7. Error: Executable doesn't exist

```bash
desktopfy -n "balena etcher" -e ~/balena_etcher/etcher/falseBalena.AppImage -i ~/balena_etcher/etcher/etcher.ico -t false
```

```bash
Error: "~/balena_etcher/etcher/falseBalena.AppImage" doesn't exist

Usage: desktopfy [-n <programm_name>] [-e <executable_path>] [-i <icon_path>] [-t <true|false>]

        -n      Name of the program, for multiple words need to start and end with "" (ex. "some thing")
                (Avoid the use of special characters as *, / or others similar)

        -e      Path to the .AppImage, .bin or executable file gonna be used for execution
                (If only name is provided, the current dir gonna be used as parent)

        -i      Path to the .ico, .png or other image file that gonna be used for icon
                (If only name is provided, the current dir gonna be used as parent)

        -t      Declare if the terminal it's gonna be showed when executing the program
                (Only "true" or "false" arguments are accepted)
```

8. Error: Icon image doesn't exist

```bash
desktopfy -n "balena etcher" -e ~/balena_etcher/etcher/balenaEtcher-1.7.8-x64.AppImage -i ~/balena_etcher/etcher/falseEtcher.ico -t false
```

```bash
Error: "~/balena_etcher/etcher/falseEtcher.ico" doesn't exist

Usage: desktopfy [-n <programm_name>] [-e <executable_path>] [-i <icon_path>] [-t <true|false>]

        -n      Name of the program, for multiple words need to start and end with "" (ex. "some thing")
                (Avoid the use of special characters as *, / or others similar)

        -e      Path to the .AppImage, .bin or executable file gonna be used for execution
                (If only name is provided, the current dir gonna be used as parent)

        -i      Path to the .ico, .png or other image file that gonna be used for icon
                (If only name is provided, the current dir gonna be used as parent)

        -t      Declare if the terminal it's gonna be showed when executing the program
                (Only "true" or "false" arguments are accepted)
```

9. Error: Invalid terminal argument

```bash
desktopfy -n "balena etcher" -e ~/balena_etcher/etcher/balenaEtcher-1.7.8-x64.AppImage -i ~/balena_etcher/etcher/etcher.ico -t invalidArgument
```

```bash
Error: "invalidArgument" isn't a valid argument for -t

Usage: desktopfy [-n <programm_name>] [-e <executable_path>] [-i <icon_path>] [-t <true|false>]

        -n      Name of the program, for multiple words need to start and end with "" (ex. "some thing")
                (Avoid the use of special characters as *, / or others similar)

        -e      Path to the .AppImage, .bin or executable file gonna be used for execution
                (If only name is provided, the current dir gonna be used as parent)

        -i      Path to the .ico, .png or other image file that gonna be used for icon
                (If only name is provided, the current dir gonna be used as parent)

        -t      Declare if the terminal it's gonna be showed when executing the program
                (Only "true" or "false" arguments are accepted)
```

## Authors

* [@Cromega08](https://www.github.com/cromega08)

## License

* [GNU AGPL v3.0](https://choosealicense.com/licenses/agpl-3.0/)
