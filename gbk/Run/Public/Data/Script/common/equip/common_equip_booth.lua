--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800003_g_ScriptId = 800003 

--��һ�������ID
--g_MissionIdPre =


--�����ı�����
x800003_g_MissionName="�̵�����"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800003_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800003_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800003_g_ScriptId,x800003_g_MissionName);
end


--********************
--����������
--**********************************
function x800003_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800003_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800003_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800003_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800003_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800003_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800003_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800003_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800003_OnItemChanged( sceneId, selfId, itemdataId )
end
