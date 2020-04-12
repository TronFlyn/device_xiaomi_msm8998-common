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

sleep 30s
#set cpu and gpu
chmod 777 /sys/bus/cpu/devices/cpu0/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu0/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu0/cpufreq/scaling_governor
echo "1900800" > /sys/bus/cpu/devices/cpu0/cpufreq/scaling_max_freq
echo "1478400" > /sys/bus/cpu/devices/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu0/online
echo "1" > /sys/bus/cpu/devices/cpu0/online
chmod 444 /sys/bus/cpu/devices/cpu0/online

chmod 777 /sys/bus/cpu/devices/cpu1/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu1/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu1/cpufreq/scaling_governor
echo "1900800" > /sys/bus/cpu/devices/cpu1/cpufreq/scaling_max_freq
echo "1478400" > /sys/bus/cpu/devices/cpu1/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu1/online
echo "1" > /sys/bus/cpu/devices/cpu1/online
chmod 444 /sys/bus/cpu/devices/cpu1/online

chmod 777 /sys/bus/cpu/devices/cpu2/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu2/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu2/cpufreq/scaling_governor
echo "1900800" > /sys/bus/cpu/devices/cpu2/cpufreq/scaling_max_freq
echo "1478400" > /sys/bus/cpu/devices/cpu2/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu2/online
echo "1" > /sys/bus/cpu/devices/cpu2/online
chmod 444 /sys/bus/cpu/devices/cpu2/online

chmod 777 /sys/bus/cpu/devices/cpu3/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu3/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu3/cpufreq/scaling_governor
echo "1900800" > /sys/bus/cpu/devices/cpu3/cpufreq/scaling_max_freq
echo "1478400" > /sys/bus/cpu/devices/cpu3/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu3/online
echo "1" > /sys/bus/cpu/devices/cpu3/online
chmod 444 /sys/bus/cpu/devices/cpu3/online

chmod 777 /sys/bus/cpu/devices/cpu4/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu4/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu4/cpufreq/scaling_governor
echo "2457600" > /sys/bus/cpu/devices/cpu4/cpufreq/scaling_max_freq
echo "1497600" > /sys/bus/cpu/devices/cpu4/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu4/online
echo "1" > /sys/bus/cpu/devices/cpu4/online
chmod 444 /sys/bus/cpu/devices/cpu4/online

chmod 777 /sys/bus/cpu/devices/cpu5/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu5/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu5/cpufreq/scaling_governor
echo "2457600" > /sys/bus/cpu/devices/cpu5/cpufreq/scaling_max_freq
echo "1497600" > /sys/bus/cpu/devices/cpu5/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu5/online
echo "1" > /sys/bus/cpu/devices/cpu5/online
chmod 444 /sys/bus/cpu/devices/cpu5/online

chmod 777 /sys/bus/cpu/devices/cpu6/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu6/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu6/cpufreq/scaling_governor
echo "2457600" > /sys/bus/cpu/devices/cpu6/cpufreq/scaling_max_freq
echo "1497600" > /sys/bus/cpu/devices/cpu6/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu6/online
echo "1" > /sys/bus/cpu/devices/cpu6/online
chmod 444 /sys/bus/cpu/devices/cpu6/online

chmod 777 /sys/bus/cpu/devices/cpu7/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu7/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu7/cpufreq/scaling_governor
echo "2457600" > /sys/bus/cpu/devices/cpu7/cpufreq/scaling_max_freq
echo "1497600" > /sys/bus/cpu/devices/cpu7/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu7/online
echo "1" > /sys/bus/cpu/devices/cpu7/online
chmod 444 /sys/bus/cpu/devices/cpu7/online

echo 710000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk
echo 257000000 > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
echo 710000000 > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
echo msm-adreno-tz > /sys/class/kgsl/kgsl-3d0/devfreq/governor
echo "3" > /sys/class/kgsl/kgsl-3d0/min_pwrlevel
echo "0" > /sys/class/kgsl/kgsl-3d0/max_pwrlevel
chmod 444 /sys/class/kgsl/kgsl-3d0/max_gpuclk
chmod 444 /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
chmod 444 /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
chmod 444 /sys/class/kgsl/kgsl-3d0/min_pwrlevel
chmod 444 /sys/class/kgsl/kgsl-3d0/max_pwrlevel

#optimize CPU cores
echo 0 > /proc/sys/kernel/sched_upmigrate
echo 0 > /proc/sys/kernel/sched_downmigrate
echo 10 > /proc/sys/kernel/sched_spill_nr_run
echo 85 > /proc/sys/kernel/sched_spill_load

chmod 644 /dev/cpuset/background/cpus
echo 0-1 > /dev/cpuset/background/cpus
chmod 644 /dev/cpuset/foreground/cpus
echo 2-7 > /dev/cpuset/foreground/cpus
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
