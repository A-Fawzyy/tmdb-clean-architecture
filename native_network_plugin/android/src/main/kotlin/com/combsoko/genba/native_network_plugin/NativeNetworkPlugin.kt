package com.combsoko.genba.native_network_plugin

import android.content.Context
import com.combsoko.genba.platform_channels_challenge.DefaultMethodChannelListener
import com.combsoko.genba.platform_channels_challenge.util.MethodChannelNames

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** NativeNetworkPlugin */
class NativeNetworkPlugin : FlutterPlugin, MethodCallHandler {
	private lateinit var channel: MethodChannel


	private lateinit var methodChannelHandler: MethodChannelHandler
	private var context: Context? = null
	private val methodChannelListener = DefaultMethodChannelListener()

	override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
		context = flutterPluginBinding.applicationContext
		channel = MethodChannel(flutterPluginBinding.binaryMessenger, MethodChannelNames.channelName)
		channel.setMethodCallHandler(this)
	}

	override fun onMethodCall(call: MethodCall, result: Result) {
		methodChannelHandler = MethodChannelHandler(methodChannelListener)
		methodChannelHandler.onMethodChannelCalled(call, result)
	}

	override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
		channel.setMethodCallHandler(null)
		context = null
	}
}
