--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800013_g_ScriptId = 800013

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800013_g_MissionName="��˼���ѧϰ"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800013_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������˼���ѧϰ����Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800013_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800013_g_ScriptId,x800013_g_MissionName);
end


--********************
--����������
--**********************************
function x800013_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800013_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800013_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800013_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800013_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800013_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800013_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800013_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800013_OnItemChanged( sceneId, selfId, itemdataId )
end
