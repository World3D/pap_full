--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x800018_g_ScriptId = 800018

--��һ�������ID
--g_MissionIdPre =



--�����ı�����
x800018_g_MissionName="�ɳ��ʼ���"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x800018_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д�����ɳ��ʼ�������Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800018_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800018_g_ScriptId,x800018_g_MissionName);
end


--********************
--����������
--**********************************
function x800018_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800018_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800018_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800018_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800018_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800018_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800018_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800018_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800018_OnItemChanged( sceneId, selfId, itemdataId )
end
