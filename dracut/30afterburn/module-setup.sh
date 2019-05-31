#!/bin/bash
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

depends() {
    echo systemd network
}

install() {
    inst_multiple afterburn

    inst_simple "$moddir/azure-hostname.service" \
        "$systemdutildir/system/azure-hostname.service"
}
