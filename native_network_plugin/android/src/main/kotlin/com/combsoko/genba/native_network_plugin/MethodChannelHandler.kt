package com.combsoko.genba.native_network_plugin

import com.combsoko.genba.tmdb_clean_architecture.MethodChannelListener
import com.combsoko.genba.tmdb_clean_architecture.util.MethodChannelNames
import com.combsoko.genba.tmdb_clean_architecture.util.MethodChannelParameterNames
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

class MethodChannelHandler(private val methodChannelListener: MethodChannelListener) {

	/**
	 * Handles the call of method channel
	 * @param call the method call
	 * @param result the method channel result
	 */
	fun onMethodChannelCalled(
		call: MethodCall,
		result: MethodChannel.Result,
	) {
		when(call.method) {
			MethodChannelNames.get -> {
				if (call.hasArgument(MethodChannelParameterNames.path) && call.hasArgument(MethodChannelParameterNames.queryParameters)) {
					val url = call.argument<String>(MethodChannelParameterNames.path) ?: ""
					val queryParameters = call.argument<Map<String, String>>(MethodChannelParameterNames.queryParameters) ?: mapOf()
					GlobalScope.launch {
						val json = methodChannelListener.getRequest(url, queryParameters)
						result.success(json)
					}
				} else {
					result.error("5", "error native getIsCalled", "exc")
				}
			}
		}
	}
}
