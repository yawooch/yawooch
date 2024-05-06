package com.kh.network.server;

import com.kh.network.tcp.server.Server;

public class Application
{
    public static void main(String[] args)
    {
        new Server().serverStart();
    }
}
