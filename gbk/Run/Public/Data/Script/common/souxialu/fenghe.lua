--���ܣ���ϒ���¼

x500003_g_ScriptId = 500003
x500003_g_MissionName="��ϒ���¼"
--**********************************

--������ں���

--**********************************

function x500003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
--	SewSouXiaItem( sceneId, selfId, targetId)
end



--**********************************

--�о��¼�

--**********************************

function x500003_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x500003_g_ScriptId, x500003_g_MissionName)
end



--**********************************

--����������

--**********************************

function x500003_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x500003_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x500003_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x500003_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x500003_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x500003_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x500003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x500003_OnItemChanged(sceneId, selfId, itemdataId)

end
