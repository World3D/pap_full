--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800001_g_ScriptId = 800001

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800001_g_MissionName="װ����"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800001_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800001_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800001_g_ScriptId,x800001_g_MissionName);
end


--********************
--����������
--**********************************
function x800001_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800001_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800001_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800001_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800001_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800001_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800001_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800001_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800001_OnItemChanged( sceneId, selfId, itemdataId )
end
