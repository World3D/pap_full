--����֮��Ǯ����

--MisDescBegin
--�ű���
x800026_g_ScriptId = 800026
--MisDescEnd




function x800026_SubTrainMoneyRate( sceneId, level, attack, mode, constant )	--����������ִ�д˽ű�
	local mode = mode/10
	local Money
	if level < 10 then
		Money = ceil(level*attack*mode)
	else
		Money = ceil(level*level*attack*mode/10)
	end
	
	if Money > 0 then
		return Money
	else
		return 0
	end
end




--**********************************
--������ں���
--**********************************
function x800026_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--		(����д������׽���Ľű��ӿ�)
end

--**********************************
--�о��¼�
--**********************************
function x800026_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x800026_g_ScriptId,x800026_g_MissionName);
end


--********************
--����������
--**********************************
function x800026_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x800026_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800026_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800026_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800026_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800026_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800026_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800026_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800026_OnItemChanged( sceneId, selfId, itemdataId )
end
