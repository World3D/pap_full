--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800000_g_ScriptId = 800000

--��һ�������ID
--g_MissionIdPre =


--�����ı�����
x800000_g_MissionName="��Ҫ���"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800000_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800000_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800000_g_ScriptId,x800000_g_MissionName);
end


--********************
--����������
--**********************************
function x800000_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800000_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800000_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800000_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800000_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800000_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800000_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800000_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800000_OnItemChanged( sceneId, selfId, itemdataId )
end
