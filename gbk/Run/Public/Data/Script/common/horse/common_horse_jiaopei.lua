--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800014_g_ScriptId = 800014

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800014_g_MissionName="��˽���"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800014_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800014_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800014_g_ScriptId,x800014_g_MissionName);
end


--********************
--����������
--**********************************
function x800014_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800014_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800014_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800014_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800014_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800014_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800014_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800014_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800014_OnItemChanged( sceneId, selfId, itemdataId )
end
