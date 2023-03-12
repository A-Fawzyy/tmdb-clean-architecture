package com.combsoko.genba.platform_channels_challenge

interface MethodChannelListener {

	/**
	 * performs get API request and returns the response as a string
	 */
	suspend fun getRequest(url: String, queryParameters: Map<String, Any>): String
}
