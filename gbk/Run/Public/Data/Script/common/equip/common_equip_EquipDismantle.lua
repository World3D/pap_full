--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800005_g_ScriptId = 800005 

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800005_g_MissionName="װ�����"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800005_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800005_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800005_g_ScriptId,x800005_g_MissionName);
end


--********************
--����������
--**********************************
function x800005_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800005_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800005_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800005_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800005_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800005_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800005_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800005_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800005_OnItemChanged( sceneId, selfId, itemdataId )
end
