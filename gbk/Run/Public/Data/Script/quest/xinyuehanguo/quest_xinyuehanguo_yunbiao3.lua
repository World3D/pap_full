--���ܣ���������
--NPC�����º��� ����˹


x211011_g_ScriptId = 211011
x211011_g_MissionName="��������"

--**********************************

--������ں���

--**********************************

function x211011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y��������")
		AddText(sceneId, "�������ǵĵ��̣��͵��������ֵ����ġ�ֻҪ������Ƿ��������ģ����õ��ϵ�Ǳ������������Ͼ����г���ͷ�ص�һ�졣���������ٺ١����ٺ١����ҵĵ��أ��ѵ������ڵ�˳��ǣ���ˣ��Ҹ��Ҵ���İ������²��ˡ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211011_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211011_g_ScriptId, x211011_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211011_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211011_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211011_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211011_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211011_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211011_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211011_OnItemChanged(sceneId, selfId, itemdataId)

end