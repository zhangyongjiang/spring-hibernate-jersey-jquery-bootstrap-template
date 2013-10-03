package demo;

import common.util.web.EmbeddedJetty;
import common.util.web.JettyWebAppContext;

public class StandaloneServer {
    public static void main(String[] args) throws Exception {
        EmbeddedJetty jetty = new EmbeddedJetty();
        jetty.setPort(9080);
        JettyWebAppContext jwac = new JettyWebAppContext();
        jwac.setContextPath("/test");
        jwac.setExtraClassPath("./src/main/resources/prod,./src/main/resources/shared");
        jetty.addWebAppContext(jwac.getWebAppContext());
        jetty.start();
        jetty.join();
    }
}
