--���ܽű�
--����ļ��
--MisDescBegin
--�ű���
x300307_g_ScriptId = 300307

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x300307_g_MissionName="����ļ��"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x300307_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

end

--**********************************
--�о��¼�
--**********************************
function x300307_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x300307_g_ScriptId,x300307_g_MissionName);
end


--********************
--����������
--**********************************
function x300307_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x300307_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x300307_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x300307_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x300307_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x300307_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x300307_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x300307_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x300307_OnItemChanged( sceneId, selfId, itemdataId )
end
