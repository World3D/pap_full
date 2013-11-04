//---------------------------------------------------------------------------
// Script Engine by FireFox
// Desc:	simple double linked node class
//---------------------------------------------------------------------------
#include "FoxWin32.h"
#include "FoxDebug.h"
#include "FoxList.h"
////---------------------------------------------------------------------------
//// 函数:	FoxList
//// 功能:	构造
//// 参数:	void
//// 返回:	void
////---------------------------------------------------------------------------
//inline FoxList::FoxList(void)
//{
//	m_ListHead.m_pNext = &m_ListTail;
//	m_ListTail.m_pPrev = &m_ListHead;
//}
////-------------------------------------------------------------------------
//// 函数:	IsEmpty
//// 功能:	是否为空
//// 参数:	void
//// 返回:	BOOL
////---------------------------------------------------------------------------
//inline BOOL FoxList::IsEmpty(void)
//{
//	return (m_ListHead.GetNext() == NULL);
//}
////-------------------------------------------------------------------------
//// 函数:	GetHead
//// 功能:	取得链表的头
//// 参数:	void
//// 返回:	FoxNode*
////---------------------------------------------------------------------------
//inline FoxNode* FoxList::GetHead(void)
//{
//	return m_ListHead.GetNext();
//}
////-------------------------------------------------------------------------
//// 函数:	GetTail
//// 功能:	取得链表的尾
//// 参数:	void
//// 返回:	FoxNode*
////---------------------------------------------------------------------------
//inline FoxNode* FoxList::GetTail(void)
//{
//	return m_ListTail.GetPrev();
//}
////-------------------------------------------------------------------------
//// 函数:	AddHead
//// 功能:	在头部增加一个节点
//// 参数:	FoxNode*
//// 返回:	BOOL
////---------------------------------------------------------------------------
//inline void FoxList::AddHead(FoxNode *pNode)
//{
//	m_ListHead.InsertAfter(pNode);
//}
////-------------------------------------------------------------------------
//// 函数:	AddTail
//// 功能:	在末尾增加一个节点
//// 参数:	FoxNode*
//// 返回:	void
////---------------------------------------------------------------------------
//inline void FoxList::AddTail(FoxNode *pNode)
//{
//	m_ListTail.InsertBefore(pNode);
//}
////-------------------------------------------------------------------------
//// 函数:	RemoveHead
//// 功能:	删除第一个节点
//// 参数:	void
//// 返回:	FoxNode*
////---------------------------------------------------------------------------
//inline FoxNode* FoxList::RemoveHead(void)
//{
//	FoxNode* pNode = m_ListHead.GetNext();
//	if (pNode)
//		pNode->Remove();
//	return pNode;
//}
////-------------------------------------------------------------------------
//// 函数:	RemoveTail
//// 功能:	删除最后一个节点
//// 参数:	void
//// 返回:	FoxNode*
////---------------------------------------------------------------------------
//inline FoxNode* FoxList::RemoveTail(void)
//{
//	FoxNode* pNode = m_ListTail.GetPrev();
//	if (pNode)
//		pNode->Remove();
//	return pNode;
//}
////-------------------------------------------------------------------------
//// 函数:	GetNodeCount
//// 功能:	取得节点个数
//// 参数:	void
//// 返回:	LONG
////---------------------------------------------------------------------------
//inline LONG FoxList::GetNodeCount(void)
//{
//	long nNode = 0;
//	FoxNode* pNode = GetHead();
//	while (pNode)
//	{
//		pNode = pNode->GetNext();
//		nNode++;
//	}
//	return nNode;
//}
////-------------------------------------------------------------------------
