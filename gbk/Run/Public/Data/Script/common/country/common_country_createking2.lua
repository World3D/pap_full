--���ܽű�
--������ȡļ���ʽ�
--MisDescBegin
--�ű���
x300308_g_ScriptId = 300308

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x300308_g_MissionName="��ȡļ���ʽ�"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x300308_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

end

--**********************************
--�о��¼�
--**********************************
function x300308_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x300308_g_ScriptId,x300308_g_MissionName);
end


--********************
--����������
--**********************************
function x300308_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x300308_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x300308_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x300308_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x300308_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x300308_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x300308_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x300308_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x300308_OnItemChanged( sceneId, selfId, itemdataId )
end
