//---------------------------------------------------------------------------
// Modify by viticm<viticm@126.com> 
// PAP Engine(c) 2013-2013
// File:	lextend.c
// Date:	2001-9-27 15:46:40
// Code:	Romandou
// Desc:	��չ��LuaAPI����
//---------------------------------------------------------------------------
#include "lua.h"
#include "string.h"
#include <stdio.h>
#include <stdarg.h>

//---------------------------------------------------------------------------
// ����:	lua_settable
// ����:	�޸�Lua table�е�ĳ����Ա��ֵ
// ����:	lua_State * L
// ����:	int nIndex �����ڶ��е�index
// ����:	const char * szMemberName ���ַ�����ʾ��Ա������
// ����:	double Number ��Ա����ֵ
// ����:	int 
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//                   lua_settableMember
//    �ú����������ɵĺ�����ɣ���ʵ�ָı�Lua Table�е�ĳ��������ֵ
//    Lua��Table�ı�����ʽ�����֣�һ������������ʽ��ʾ�� Table[1],����һ
//	  �������ַ�������ʽ��ʾ����Table.Member��	
//	  ͬʱ������ֵ������Number��String��CFun��
//	 	  nIndexΪ�����ڶ�ջ�е�λ�á�
//---------------------------------------------------------------------------
int lua_settable_DoubleFromName(lua_State * L, int nIndex, const char * szMemberName, double Number)
{
	if (! lua_istable(L, nIndex))
		return 0;
	lua_pushstring(L, szMemberName);
	lua_pushnumber(L, Number);
	lua_settable(L, nIndex);
	return 1;
}


//---------------------------------------------------------------------------
// ����:	lua_settable_IntFromName
// ����:	
// ����:	lua_State * L
// ����:	int nIndex
// ����:	const char * szMemberName
// ����:	int Number
// ����:	int 
//---------------------------------------------------------------------------
int lua_settable_IntFromName(lua_State * L, int nIndex, const char * szMemberName, int Number)
{

	if (! lua_istable(L, nIndex))
		return 0;
	lua_pushstring(L, szMemberName);
	lua_pushnumber(L, (double)Number);
	lua_settable(L, nIndex);
	return 1;
	
}


//---------------------------------------------------------------------------
// ����:	lua_settable_StringFromName
// ����:	
// ����:	lua_State * L
// ����:	int nIndex
// ����:	const char * szMemberName
// ����:	char * szString
// ����:	int 
//---------------------------------------------------------------------------
int lua_settable_StringFromName(lua_State * L ,int nIndex, const char * szMemberName, char * szString)
{
	
	if (! lua_istable(L, nIndex))
		return 0;
	lua_pushstring(L, szMemberName);
	lua_pushstring(L, szString);
	lua_settable(L, nIndex);
	return 1;
	
}

//---------------------------------------------------------------------------
// ����:	lua_settable_StringFromId
// ����:	
// ����:	lua_State * L
// ����:	int nIndex
// ����:	int Id
// ����:	const char * szString
// ����:	int 
//---------------------------------------------------------------------------
int lua_settable_StringFromId(lua_State * L, int nIndex, int Id, const char * szString)
{
	if (! lua_istable(L, nIndex))
		return 0;
	lua_pushnumber(L, (double)Id);
	lua_pushstring(L, szString);
	lua_settable(L, nIndex);
	return 1;
}


//---------------------------------------------------------------------------
// ����:	lua_settable_DoubleFromId
// ����:	
// ����:	lua_State * L
// ����:	int nIndex
// ����:	int Id
// ����:	double nNumber
// ����:	int 
//---------------------------------------------------------------------------
int lua_settable_DoubleFromId(lua_State * L , int nIndex, int Id, double nNumber)
{
	if (! lua_istable(L, nIndex))
		return 0;
	lua_pushnumber(L, (double) Id);
	lua_pushnumber(L, nNumber);
	lua_settable(L, nIndex);
	return 1;
}

//---------------------------------------------------------------------------
// ����:	lua_settable_IntFromId
// ����:	
// ����:	lua_State * L
// ����:	int nIndex
// ����:	int Id
// ����:	int nNumber
// ����:	int 
//---------------------------------------------------------------------------
int lua_settable_IntFromId(lua_State * L, int nIndex, int Id, int nNumber)
{
	if (! lua_istable(L, nIndex))
		return 0;
	lua_pushnumber(L, (double) Id);
	lua_pushnumber(L, (double) nNumber);
	lua_settable(L, nIndex);
	return 1;
}

//---------------------------------------------------------------------------
// ����:	lua_settable_CFunFromName
// ����:	
// ����:	lua_State * L
// ����:	int nIndex
// ����:	const char * szMemberName
// ����:	lua_CFunction CFun
// ����:	int 
//---------------------------------------------------------------------------
int lua_settable_CFunFromName(lua_State * L, int nIndex, const char * szMemberName, lua_CFunction CFun)
{
	if (! lua_istable(L, nIndex))
		return 0;
	lua_pushstring(L, szMemberName);
	lua_pushcfunction(L, CFun);
	lua_settable(L, nIndex);
	return 1;
}

//---------------------------------------------------------------------------
// ����:	lua_settable_CFunFromId
// ����:	
// ����:	lua_State * L
// ����:	int nIndex
// ����:	int nId
// ����:	lua_CFunction CFun
// ����:	int 
//---------------------------------------------------------------------------
int lua_settable_CFunFromId(lua_State * L, int nIndex, int nId, lua_CFunction CFun)
{
	if (! lua_istable(L, nIndex))
		return 0;
	lua_pushnumber(L, nId);
	lua_pushcfunction(L, CFun);
	lua_settable(L, nIndex);
	return 1;
}


//---------------------------------------------------------------------------
// ����:	Lua_GetValuesFromStack
// ����:	
// ����:	lua_State * L
// ����:	char * cFormat
// ����:	...
// ����:	int 
//---------------------------------------------------------------------------
int Lua_GetValuesFromStack(lua_State * L, char * cFormat, ...)	
{

	va_list vlist;
	double* pNumber;
	 const char  *pString;
	   const char ** pStrPoint;
	
	int i = 0;
	int nTopIndex = 0;
	int nIndex = 0;
	int nValueNum = 0;//cFormat���ַ����ȣ���ʾ��Ҫȡ�Ĳ�������
	
	
	if (! L)
		return 0;
	
	nTopIndex = lua_gettop(L);	
	nValueNum = strlen(cFormat);
	
	if (nTopIndex == 0 || nValueNum == 0)//����ջ�������ݻ�ȡ�����Ƿ���FALSE
		return 0;
	
	if (nTopIndex < nValueNum)
		nIndex = 1 ;
	else
		nIndex = nTopIndex - nValueNum +1;
	
	{
		va_start(vlist, cFormat);     
		
		while (cFormat[i] != '\0')
		{
			
			switch(cFormat[i])
			{
			case 'n'://����ֵΪ��ֵ��,Number,��ʱLuaֻ����double�ε�ֵ
				{
					pNumber = va_arg(vlist, double *);
					
					if (pNumber == NULL)
						return 0;
					
					if (lua_isnumber(L, nIndex ))
					{

						* pNumber = lua_tonumber(L, nIndex++);
						
					}
					else
					{
					//	ScriptError(LUA_SCRIPT_NOT_NUMBER_ERROR);
						return 0;
					}
					
					
				}
				break;
			case 's'://�ַ�����
				{
					pStrPoint = va_arg(vlist, const char **);
					
					if (pStrPoint == NULL)
						return 0;
					
					if (lua_isstring(L, nIndex))
					{
						pString = lua_tostring(L, nIndex++);
					
						*pStrPoint = pString;
						
					}
					else
					{
					//	ScriptError(LUA_SCRIPT_NOT_STRING_ERROR);
						return 0;
					}
				}
				break;
				
			}
			
			

			i ++;	
		}
		va_end(vlist);     		/* Reset variable arguments.      */
		
	}
	return	1;
}

// output functions
LUA_API void lua_outerrmsg(const char * szerrmsg)
{
    fprintf(stderr, szerrmsg); 
}

LUA_API void lua_outoutmsg(const char * szoutmsg) 
{
    fprintf(stdout, szoutmsg);
}

LUA_API int lua_execute(lua_State *L)
{
    int status;
    status = lua_call(L, 0, LUA_MULTRET);  /* call main */
    return status;
}
