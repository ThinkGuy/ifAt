package com.ifat.config;

import java.util.TreeMap;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;



public class ServerEncoder implements Encoder.Text<TreeMap<String, Integer>> {

	@Override
	public void destroy() {
	}

	@Override
	public void init(EndpointConfig arg0) {
	}

	@Override
	public String encode(TreeMap<String, Integer> map) throws EncodeException {
		try {
			return map.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
