--���ܣ��ֿ�
--NPC�����º��� �ֿ��ϰ壬�ֿ���

x211017_g_ScriptId = 211017
x211017_g_MissionName="�ֿ�"

--**********************************

--������ں���

--**********************************

function x211017_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BankBegin(sceneId, selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211017_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211017_g_ScriptId, x211017_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211017_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211017_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211017_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211017_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211017_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211017_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211017_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211017_OnItemChanged(sceneId, selfId, itemdataId)

end