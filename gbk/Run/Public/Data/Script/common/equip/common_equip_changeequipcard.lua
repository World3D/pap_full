--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800017_g_ScriptId = 800017

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800017_g_MissionName="װ�����͸���"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800017_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800017_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800017_g_ScriptId,x800017_g_MissionName);
end


--********************
--����������
--**********************************
function x800017_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800017_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800017_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800017_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800017_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800017_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800017_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800017_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800017_OnItemChanged( sceneId, selfId, itemdataId )
end
