--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800020_g_ScriptId = 800020

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800020_g_MissionName="������"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800020_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800020_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800020_g_ScriptId,x800020_g_MissionName);
end


--********************
--����������
--**********************************
function x800020_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800020_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800020_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800020_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800020_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800020_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800020_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800020_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800020_OnItemChanged( sceneId, selfId, itemdataId )
end
