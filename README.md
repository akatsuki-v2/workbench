# Akatsuki v2 development workbench

This project is probably the easiest osu! server setup known to man (by design).

The process is roughly

```py
# clone this repository onto your box
git clone git@github.com:akatsuki-v2/workbench.git
cd workbench

# initialize all the services submodules
git submodule update --init

# build the docker images for the services
make build

# add your domain's certificates for nginx
cp /path/to/your/certs/*.pem nginx-certs

# configure nginx for users & admins to your liking
nano nginx-templates/user_gateway.conf.template
nano nginx-templates/admins_gateway.conf.template

# run the services
make run
```

Though your milage will very - please report any issues so we can fix them.
