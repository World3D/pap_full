--���ܣ�ѧϰ�ɿ���

x510001_g_ScriptId = 510001
x510001_g_MissionName="ѧϰ�ɿ���"
--**********************************

--������ں���

--**********************************

function x510001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
--	DismantleSouXiaItem( sceneId, selfId, targetId)
end



--**********************************

--�о��¼�

--**********************************

function x510001_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x510001_g_ScriptId, x510001_g_MissionName)
end



--**********************************

--����������

--**********************************

function x510001_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x510001_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x510001_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x510001_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x510001_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x510001_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x510001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x510001_OnItemChanged(sceneId, selfId, itemdataId)

end
