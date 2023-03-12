package com.combsoko.genba.platform_channels_challenge

import com.combsoko.genba.platform_channels_challenge.util.MethodChannelNames
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

object NativeMethodChannel {
	var methodChannel: MethodChannel? = null

	fun configureChannel(binaryMessenger: BinaryMessenger) {
		methodChannel = MethodChannel(binaryMessenger, MethodChannelNames.channelName)
	}
}
