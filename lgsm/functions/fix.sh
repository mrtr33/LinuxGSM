#!/bin/bash
# LinuxGSM fix.sh function
# Author: Daniel Gibbs
# Website: https://linuxgsm.com
# Description: Overall function for managing fixes.
# Runs functions that will fix an issue.

local commandname="FIX"
local commandaction="Fix"

# Messages that are displayed for some fixes
fn_fix_msg_start(){
	fn_print_dots "Applying ${fixname} fix: ${gamename}"
	sleep 0.5
	fn_print_info "Applying ${fixname} fix: ${gamename}"
	fn_script_log_info "Applying ${fixname} fix: ${gamename}"
	sleep 0.5
}

fn_fix_msg_start_nl(){
	fn_print_dots "Applying ${fixname} fix: ${gamename}"
	sleep 0.5
	fn_print_info "Applying ${fixname} fix: ${gamename}"
	fn_script_log_info "Applying ${fixname} fix: ${gamename}"
	sleep 0.5
}

fn_fix_msg_end(){
	if [ $? -ne 0 ]; then
		fn_print_error_nl "Applying ${fixname} fix: ${gamename}"
		fn_script_log_error "Applying ${fixname} fix: ${gamename}"
	else
		fn_print_ok_nl "Applying ${fixname} fix: ${gamename}"
		fn_script_log_pass "Applying ${fixname} fix: ${gamename}"
	fi
}

# Fixes that are run on start
if [ "${function_selfname}" != "command_install.sh" ]&&[ -z "${fixbypass}" ]; then
	if [ -n "${appid}" ]; then
		fix_steamcmd.sh
	fi

	if  [ "${shortname}" == "arma3" ]; then
		fix_arma3.sh
	elif [ "${shortname}" == "ark" ]; then
		fix_ark.sh
	elif [ "${shortname}" == "csgo" ]; then
		fix_csgo.sh
	elif [ "${shortname}" == "dst" ]; then
		fix_dst.sh
	elif [ "${shortname}" == "ges" ]; then
		fix_ges.sh
	elif [ "${shortname}" == "ins" ]; then
		fix_ins.sh
	elif [ "${shortname}" == "rust" ]; then
		fix_rust.sh
	elif [ "${shortname}" == "rw" ]; then
		fix_rw.sh
	elif [ "${shortname}" == "sdtd" ]; then
		fix_sdtd.sh
	elif [ "${shortname}" == "ss3" ]; then
		fix_ss3.sh
	elif [ "${shortname}" == "ts3" ]; then
		fix_ts3.sh		
	elif [ "${shortname}" == "mta" ]; then
		fix_mta.sh
	elif [ "${shortname}" == "wurm" ]; then
		fix_wurm.sh
	fi
fi

# Fixes that are run on install only.
if [ "${function_selfname}" == "command_install.sh" ]; then
		echo ""
		echo "Applying Post-Install Fixes"
		echo "================================="
		sleep 0.5
		if [ "${shortname}" == "kf" ]; then
			fix_kf.sh
		elif [ "${shortname}" == "kf2" ]; then
			fix_kf2.sh
		elif [ "${shortname}" == "ro" ]; then
			fix_ro.sh
		elif [ "${shortname}" == "ut2k4" ]; then
			fix_ut2k4.sh
		elif [ "${shortname}" == "ut" ]; then
			fix_ut.sh
		elif [ "${shortname}" == "ut3" ]; then
			fix_ut3.sh
		elif [ "${shortname}" == "tf2" ]; then
			fix_tf2.sh
		else
			fn_print_information_nl "No fixes required."
		fi

fi
