#include<iostream>
using namespace std;

int main() {
    char ou = 'A';
    int num = 0;
    cout<<"{";
    while(num<=63)
    {
        if(ou=='Z'+1)
            ou='a';
        if(ou=='z'+1)
            ou='0';
        if(ou=='9'+1)
            ou='+';
        if(ou=='+'+1)
            ou='/';
        // cout<<num++<<" "<<ou++<<endl;
        cout<<num++<<", ";
    }
    cout<<64<<"}, {";

    ou = 'A';
    num = 0;
    while(num<=63)
    {
        if(ou=='Z'+1)
            ou='a';
        if(ou=='z'+1)
            ou='0';
        if(ou=='9'+1)
            ou='+';
        if(ou=='+'+1)
            ou='/';
        // cout<<num++<<" "<<ou++<<endl;
        num++;
        cout<<"\'"<<ou++<<"\', ";
    }
    cout<<"\'=\' }";
    
}