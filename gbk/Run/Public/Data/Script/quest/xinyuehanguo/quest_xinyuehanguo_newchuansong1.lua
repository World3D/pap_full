--���ܣ����ִ崫��
--NPC������

x211064_g_ScriptId = 211064
x211064_g_MissionName="�����̵��"
--**********************************

--������ں���

--**********************************

function x211064_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, 15 )
	--if GetLevel( sceneId, selfId ) >= 10 then
	--	SetPos(sceneId, selfId,108,258)
	--	BeginEvent(sceneId)
	--		strText = "�������˺������Ĺ㳡"
	--		AddText(sceneId,strText);
	--	EndEvent(sceneId)
	--	DispatchMissionTips(sceneId,selfId)
	--else
	--	BeginEvent(sceneId)
	--		AddText(sceneId, "#Y�������Ĺ㳡")
	--		AddText(sceneId, "ֻ�д�����õ�����Ͽɵ�Ӣ�ۣ��ҲŻ����˽�������͵��������Ĺ㳡������10����ʱ�򣬾ͻ�õ���ҵ��Ͽɣ���Ϊ�����Ӣ�ۣ�")
	--	EndEvent(sceneId)
	--	DispatchEventList(sceneId,selfId,targetId)
	--end
end



--**********************************

--�о��¼�

--**********************************

function x211064_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211064_g_ScriptId, x211064_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211064_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211064_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211064_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211064_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211064_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211064_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211064_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211064_OnItemChanged(sceneId, selfId, itemdataId)

end