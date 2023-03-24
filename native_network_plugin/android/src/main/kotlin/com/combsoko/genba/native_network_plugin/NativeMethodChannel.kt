package com.combsoko.genba.tmdb_clean_architecture

import com.combsoko.genba.tmdb_clean_architecture.util.MethodChannelNames
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

object NativeMethodChannel {
	var methodChannel: MethodChannel? = null

	fun configureChannel(binaryMessenger: BinaryMessenger) {
		methodChannel = MethodChannel(binaryMessenger, MethodChannelNames.channelName)
	}
}
