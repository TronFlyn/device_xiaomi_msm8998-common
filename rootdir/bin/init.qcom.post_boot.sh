#!/vendor/bin/sh

# Copyright (c) 2012-2013, 2016, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Enable bus-dcvs
for cpubw in /sys/class/devfreq/*qcom,cpubw*
do
    echo "bw_hwmon" > $cpubw/governor
    echo 50 > $cpubw/polling_interval
    echo 1525 > $cpubw/min_freq
    echo "3143 5859 11863 13763" > $cpubw/bw_hwmon/mbps_zones
    echo 4 > $cpubw/bw_hwmon/sample_ms
    echo 34 > $cpubw/bw_hwmon/io_percent
    echo 20 > $cpubw/bw_hwmon/hist_memory
    echo 10 > $cpubw/bw_hwmon/hyst_length
    echo 0 > $cpubw/bw_hwmon/low_power_ceil_mbps
    echo 34 > $cpubw/bw_hwmon/low_power_io_percent
    echo 20 > $cpubw/bw_hwmon/low_power_delay
    echo 0 > $cpubw/bw_hwmon/guard_band_mbps
    echo 250 > $cpubw/bw_hwmon/up_scale
    echo 1600 > $cpubw/bw_hwmon/idle_mbps
done

for memlat in /sys/class/devfreq/*qcom,memlat-cpu*
do
    echo "mem_latency" > $memlat/governor
    echo 10 > $memlat/polling_interval
    echo 400 > $memlat/mem_latency/ratio_ceil
done
echo "cpufreq" > /sys/class/devfreq/soc:qcom,mincpubw/governor

setprop vendor.post_boot.parsed 1

sleep 10s
#GPU
echo 710000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk
echo 710000000 > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
echo "0" > /sys/class/kgsl/kgsl-3d0/max_pwrlevel
chmod 444 /sys/class/kgsl/kgsl-3d0/max_gpuclk
chmod 444 /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
chmod 444 /sys/class/kgsl/kgsl-3d0/max_pwrlevel

#optimize CPU cores
chmod 644 /dev/cpuset/background/cpus
echo 0-1 > /dev/cpuset/background/cpus
chmod 644 /dev/cpuset/foreground/cpus
echo 4-7 > /dev/cpuset/foreground/cpus
chmod 644 /dev/cpuset/top-app/cpus
echo 4-7 > /dev/cpuset/top-app/cpus
chmod 644 /dev/cpuset/system-background/cpus
echo 0-3 > /dev/cpuset/system-background/cpus
chmod 644 /dev/cpuset/camera-daemon/cpus
echo 0-3 > /dev/cpuset/camera-daemon/cpus

#msm_thermal
echo 0 > /sys/module/msm_thermal/core_control/enabled
echo 0 > /sys/module/msm_thermal/vdd_restriction/enabled
echo 0 > /sys/module/msm_thermal/parameters/enabled

#stune boost
chmod 644 /dev/stune/background/schedtune.boost
echo -20 > /dev/stune/background/schedtune.boost
echo 0 > /dev/stune/background/schedtune.prefer_idle
chmod 644 /dev/stune/foreground/schedtune.boost
echo 0 > /dev/stune/foreground/schedtune.boost
echo 0 > /dev/stune/foreground/schedtune.prefer_idle
chmod 644 /dev/stune/top-app/schedtune.boost
echo 20 > /dev/stune/top-app/schedtune.boost
echo 0 > /dev/stune/top-app/schedtune.prefer_idle

#enforce QC charge
echo '150' >/sys/class/power_supply/bms/temp_cool
echo '500' >/sys/class/power_supply/bms/temp_warm
chmod 755 /sys/class/power_supply/battery/constant_charge_current_max
echo `expr 3000 * 1000` > /sys/class/power_supply/battery/constant_charge_current_max
chmod 755 /sys/class/power_supply/battery/input_current_max
echo `expr 3000 * 1000` > /sys/class/power_supply/battery/input_current_max
echo 3000 > /sys/module/dwc3_msm/parameters/dcp_max_current
echo 3000 > /sys/module/dwc3_msm/parameters/hvdcp_max_current
echo 3000 > /sys/module/qpnp_smbcharger/parameters/default_dcp_icl_ma
echo 3000 > /sys/module/qpnp_smbcharger/parameters/default_hvdcp3_icl_ma
echo 3000 > /sys/module/qpnp_smbcharger/parameters/default_hvdcp_icl_ma
