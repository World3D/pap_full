--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800016_g_ScriptId = 800016

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800016_g_MissionName="װ�����ͶԵ�"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800016_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800016_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800016_g_ScriptId,x800016_g_MissionName);
end


--********************
--����������
--**********************************
function x800016_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800016_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800016_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800016_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800016_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800016_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800016_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800016_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800016_OnItemChanged( sceneId, selfId, itemdataId )
end
