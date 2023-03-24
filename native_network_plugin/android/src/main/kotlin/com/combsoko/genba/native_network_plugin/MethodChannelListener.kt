package com.combsoko.genba.tmdb_clean_architecture

interface MethodChannelListener {

	/**
	 * performs get API request and returns the response as a string
	 */
	suspend fun getRequest(url: String, queryParameters: Map<String, Any>): String
}
