--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800024_g_ScriptId = 800024

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800024_g_MissionName="��������"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800024_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800024_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800024_g_ScriptId,x800024_g_MissionName);
end


--********************
--����������
--**********************************
function x800024_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800024_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800024_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800024_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800024_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800024_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800024_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800024_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800024_OnItemChanged( sceneId, selfId, itemdataId )
end
