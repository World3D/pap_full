--���ܣ�������¼����

x500001_g_ScriptId = 500001
x500001_g_MissionName="������¼����"
--**********************************

--������ں���

--**********************************

function x500001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
--	DismantleSouXiaItem( sceneId, selfId, targetId)
end



--**********************************

--�о��¼�

--**********************************

function x500001_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x500001_g_ScriptId, x500001_g_MissionName)
end



--**********************************

--����������

--**********************************

function x500001_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x500001_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x500001_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x500001_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x500001_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x500001_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x500001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x500001_OnItemChanged(sceneId, selfId, itemdataId)

end
