--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800015_g_ScriptId = 800015

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800015_g_MissionName="��˻�ͯ"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800015_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������˻�ͯ����Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800015_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800015_g_ScriptId,x800015_g_MissionName);
end


--********************
--����������
--**********************************
function x800015_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800015_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800015_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800015_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800015_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800015_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800015_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800015_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800015_OnItemChanged( sceneId, selfId, itemdataId )
end
