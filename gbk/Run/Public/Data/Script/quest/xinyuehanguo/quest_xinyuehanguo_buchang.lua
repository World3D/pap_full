--���ܣ�������ȡ
--NPC�����º��� ���

x211015_g_ScriptId = 211015
x211015_g_MissionName="������ȡ"

--**********************************

--������ں���

--**********************************

function x211015_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y������ȡ")
		AddText(sceneId, "���ٹ���Ϊ���ҵķ�չ����˽�ķ������Լ��������ǲ������Ǵ�ҶԹ��ҵķ����ġ������ּ�⣬�����︺��Է���Ҫ��Ĺ������һ���Ĳ�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211015_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211015_g_ScriptId, x211015_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211015_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211015_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211015_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211015_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211015_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211015_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211015_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211015_OnItemChanged(sceneId, selfId, itemdataId)

end