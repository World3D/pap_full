--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800004_g_ScriptId = 800004

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800004_g_MissionName="װ���ϳ�"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800004_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800004_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800004_g_ScriptId,x800004_g_MissionName);
end


--********************
--����������
--**********************************
function x800004_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800004_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800004_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800004_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800004_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800004_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800004_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800004_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800004_OnItemChanged( sceneId, selfId, itemdataId )
end
