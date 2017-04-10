#include<iostream.h>
#include<string.h>
#include<conio.h>
#include<stdio.h>
#include<ctype.h>
#include<math.h>
void main()
{
	clrscr();
	char plaintxt[100]={""};
	char ciphertxt[100]={""};
	char option[6];
	int i,code;
	cin>>option;
	if(strcmpi(option,"encode")==0)
	{
		gets(plaintxt);
		for(i=0;i<strlen(plaintxt);i++)
		{       if(isalpha(plaintxt[i]))
			{
				code=plaintxt[i];
				code=code-97;
				code=122-code;
				ciphertxt[i]=code;
			}
			else
			{
				ciphertxt[i]=plaintxt[i];
			}
		}
		cout<<ciphertxt;
	}
	else if(strcmpi(option,"decode")==0)
	{
		gets(ciphertxt);
		for(i=0;i<strlen(ciphertxt);i++)
		{
			if(isalpha(ciphertxt[i]))
			{
				code=ciphertxt[i];
				code=abs(code-122);
				code=code+97;
				plaintxt[i]=code;
			}
			else
			{
				ciphertxt[i]=plaintxt[i];
			}
		}
		cout<<plaintxt;
	}
	getch();
}
