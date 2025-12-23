package com.yawooch.plugin;

import org.eclipse.ui.plugin.AbstractUIPlugin;
import org.osgi.framework.BundleContext;

/**
 * 플러그인 활성화 클래스
 * 이클립스가 플러그인을 로드할 때 이 클래스가 실행됩니다.
 */
public class Activator extends AbstractUIPlugin {

	// 플러그인 ID
	public static final String PLUGIN_ID = "com.yawooch.plugin"; //$NON-NLS-1$
	
	// 싱글톤 인스턴스
	private static Activator plugin;
	
	/**
	 * 생성자
	 */
	public Activator() {
	}

	/**
	 * 플러그인이 시작될 때 호출됩니다.
	 */
	public void start(BundleContext context) throws Exception {
		super.start(context);
		plugin = this;
		System.out.println("Yawooch Plugin이 시작되었습니다!");
	}

	/**
	 * 플러그인이 중지될 때 호출됩니다.
	 */
	public void stop(BundleContext context) throws Exception {
		plugin = null;
		super.stop(context);
		System.out.println("Yawooch Plugin이 중지되었습니다!");
	}

	/**
	 * 플러그인 인스턴스를 반환합니다.
	 */
	public static Activator getDefault() {
		return plugin;
	}
}
