#!/bin/bash

sudo chown -R $USER:$USER plugins themes
chmod -R 777 plugins themes

echo "Done! Permissions fixed for plugins and themes."
