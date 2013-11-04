//---------------------------------------------------------------------------
// Script Engine by FireFox
// Desc:	Simple double linked node class
//---------------------------------------------------------------------------
#include "FoxWin32.h"
#include "FoxDebug.h"
#include "FoxNode.h"
////---------------------------------------------------------------------------
//// 函数:	Foxnode
//// 功能:	构造
//// 参数:	void
//// 返回:	void
////---------------------------------------------------------------------------
//inline FoxNode::FoxNode(void)
//{
//	m_pNext = NULL;
//	m_pPrev = NULL;
//}
////---------------------------------------------------------------------------
//// 函数:	GetNext
//// 功能:	下一个结点
//// 参数:	void
//// 返回:	FoxNode*
////---------------------------------------------------------------------------
//inline FoxNode* FoxNode::GetNext(void)
//{
//	if (m_pNext->m_pNext)
//		return m_pNext;
//	return NULL;
//}
////---------------------------------------------------------------------------
//// 函数:	GetPrev
//// 功能:	前一个结点
//// 参数:	void
//// 返回:	FoxNode*
////---------------------------------------------------------------------------
//inline FoxNode* FoxNode::GetPrev(void)
//{
//	if (m_pPrev->m_pPrev)
//		return m_pPrev;
//	return NULL;
//}
////----------------------------------------------------------------------------
//// 函数:	InsertBefore
//// 功能:	在前面插入一个结点
//// 参数:	FoxNode*
//// 返回:	void
////---------------------------------------------------------------------------
//inline void FoxNode::InsertBefore(FoxNode *pNode)
//{
//	KASSERT(m_pPrev);
//	pNode->m_pPrev = m_pPrev;
//	pNode->m_pNext = this;
//	m_pPrev->m_pNext = pNode;
//	m_pPrev = pNode;
//}
////---------------------------------------------------------------------------
//// 函数:	InsertAfter
//// 功能:	在后面插入一个结点
//// 参数:	FoxNode*
//// 返回:	void
////---------------------------------------------------------------------------
//inline void FoxNode::InsertAfter(FoxNode *pNode)
//{
//	KASSERT(m_pNext);
//	pNode->m_pPrev = this;
//	pNode->m_pNext = m_pNext;
//	m_pNext->m_pPrev = pNode;
//	m_pNext = pNode;
//}
////---------------------------------------------------------------------------
//// 函数:	Remove the node
//// 功能:	删除这个结点
//// 参数:	void
//// 返回:	FoxNode*
////---------------------------------------------------------------------------
//inline void FoxNode::Remove(void)
//{
//	KASSERT(m_pPrev);
//	KASSERT(m_pNext);
//	m_pPrev->m_pNext = m_pNext;
//	m_pNext->m_pPrev = m_pPrev;
//	m_pPrev = NULL;
//	m_pNext = NULL;
//}
////---------------------------------------------------------------------------
//// 函数:	IsLinked
//// 功能:	这个节点是否链接
//// 参数:	void
//// 返回:	bool
////---------------------------------------------------------------------------
//inline BOOL FoxNode::IsLinked(void)
//{
//	return (m_pPrev && m_pNext);
//}
////--------------------------------------------------------------------------------
