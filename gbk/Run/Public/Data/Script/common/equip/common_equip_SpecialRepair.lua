--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800002_g_ScriptId = 800002

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800002_g_MissionName="װ������"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800002_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800002_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800002_g_ScriptId,x800002_g_MissionName);
end


--********************
--����������
--**********************************
function x800002_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800002_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800002_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800002_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800002_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800002_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800002_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800002_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800002_OnItemChanged( sceneId, selfId, itemdataId )
end
