--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800022_g_ScriptId = 800022

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800022_g_MissionName="�鿴���ҹ�����Ա"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800022_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800022_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800022_g_ScriptId,x800022_g_MissionName);
end


--********************
--����������
--**********************************
function x800022_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800022_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800022_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800022_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800022_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800022_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800022_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800022_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800022_OnItemChanged( sceneId, selfId, itemdataId )
end
