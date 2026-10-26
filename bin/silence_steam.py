#!/usr/bin/env python
import sys
import pathlib

def silence(file_path: pathlib.Path):
    with file_path.open("r+") as file:
        offset = 0
        is_written = False
        for line in file.readlines():
            striped_contents = line.lstrip()
            if is_written:
                file.seek(offset)
                file.write(line)
                offset += len(line)
                continue
            if not striped_contents.startswith("Exec"):
                offset += len(line)
                continue
            command = "=".join(striped_contents.split("=")[1:]).strip(" ")
            split_command = command.split(" ")
            if "steam" not in split_command:
                continue
            if "-silent" in split_command:
                continue
            split_command = [command if command != "steam" else "steam -silent"  for command in split_command]
            final_command = f"Exec={" ".join(split_command)}"
            is_written = True
            file.seek(offset)
            file.write(final_command)
            offset += len(final_command)
        file.truncate(offset)

def silence_all(applications: pathlib.Path):
    for path in applications.iterdir():
        if path.is_dir():
            continue
        if not path.name.endswith(".desktop"):
            continue
        silence(path)

def main():
    applications_path = pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else "~/.local/share/applications").expanduser()
    silence_all(applications_path)

if __name__ == "__main__":
    main()
