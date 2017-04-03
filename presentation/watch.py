"""Watch for file changes and build presentation."""

import time

import click
import pypandoc
from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer


def _convert(path):
    """Create a markdown copy of the given file, if it's an org file."""
    if path.endswith(".org"):
        pypandoc.convert_file(path, "md", outputfile=path[:-4] + ".md")


class _ConvertHandler(FileSystemEventHandler):
    """Create markdown copies of org files on modifications."""

    def on_modified(self, event):
        _convert(event.src_path)


@click.command()
@click.option("--path", type=str, default=".", help="Path to watch.")
def _watch(path):
    observer = Observer()
    observer.schedule(_ConvertHandler(), path, recursive=True)
    observer.start()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()


if __name__ == "__main__":
    _watch()
