--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800023_g_ScriptId = 800023

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800023_g_MissionName="������ҹ�����Ա"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800023_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800023_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800023_g_ScriptId,x800023_g_MissionName);
end


--********************
--����������
--**********************************
function x800023_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800023_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800023_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800023_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800023_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800023_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800023_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800023_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800023_OnItemChanged( sceneId, selfId, itemdataId )
end
