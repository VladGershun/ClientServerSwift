//
//  Server.swift
//  ClientServerSwift
//
//  Created by Vlad Gershun on 11/16/21.
//

import Foundation

func runServer() {
    
}




//void runServer() {
//    struct sockaddr_in servAddr;
//    int socketfd, listenfd;
//    //create the socket file descriptor
//    if((socketfd=socket(AF_INET, SOCK_STREAM, 0)) < 0) {
//            perror(strerror(errno));
//            exit(1);
//        }
//    //set options for the socket
//    if(setsockopt(socketfd, SOL_SOCKET, SO_REUSEADDR, &(int){1}, sizeof(int)) < 0) {
//        perror(strerror(errno));
//        exit(1);
//    }
//    memset(&servAddr, 0, sizeof(servAddr));
//    servAddr.sin_family=AF_INET;
//    servAddr.sin_port=htons(SERV_PORT);
//    servAddr.sin_addr.s_addr=htonl(INADDR_ANY);
//    //bind the socket to given port
//    if(bind(socketfd, (struct sockaddr*) &servAddr, sizeof(servAddr)) < 0){
//        perror(strerror(errno));
//        exit(1);
//    }
//    //listen to the given socket
//    if(listen(socketfd, BACKLOG) != 0) {
//        perror(strerror(errno));
//        exit(1);
//    }
//
//    unsigned int length=sizeof(struct sockaddr_in);
//    struct sockaddr_in clientAddr;
//    int numberRead=10;
//    char buf[100] = {0};
//    char date[19];
//
//    //run server until it exits
//    while(1) {
//        //create file descriptor for client
//        if((listenfd=accept(socketfd, (struct sockaddr*) &clientAddr, &length)) < 0) {
//            perror(strerror(errno));
//            exit(errno);
//        }
//        char hostName[NI_MAXHOST];
//        int hostEntry;
//        //get the host name of the client
//        hostEntry = getnameinfo((struct sockaddr*)&clientAddr, sizeof(clientAddr), hostName, sizeof(hostName), NULL, 0, NI_NUMERICSERV);
//        if(hostEntry != 0) {
//            fprintf(stderr, "Error: %s\n", gai_strerror(hostEntry));
//            exit(errno);
//        }
//        //fork for each client call
//        int procID=fork();
//        //increment number of clients connected
//        count++;
//        //if child process fails exit
//        if(procID < 0) {
//            perror(strerror(errno));
//            exit(errno);
//        }
//        //child process
//        if(procID == 0) {
//            //get current time
//            time_t t;
//            time(&t);
//            strncpy(date, ctime(&t), 18);
//            date[18]='\n';
//            //print the client name and counter to server
//            fprintf(stdout, "%s %i\n", hostName, count);
//            fflush(stdout);
//            //write current date and time to client
//            write(listenfd, date, strlen(date));
//            //exit child when done
//            exit(0);
//        }
//    }
//}
