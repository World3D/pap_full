--���ܣ����ִ�ҽ��
--NPC���ٷ�

x211042_g_ScriptId = 211042
x211042_g_MissionName="�������"
--**********************************

--������ں���

--**********************************

function x211042_OnDefaultEvent(sceneId, selfId, targetId,stateIndex,extraIndex)	--����������ִ�д˽ű�
	if	stateIndex==9 and extraIndex==13 then
		SetPos(sceneId, selfId, 160,60)
		return
	elseif stateIndex==9 and extraIndex==14	then
		SetPos(sceneId, selfId, 77,51)
		return
	end
	
	BeginEvent(sceneId)
		AddText(sceneId, "#Y�������")
		AddText(sceneId, "Ŀǰ���������ڲ��Ϸ�չ�׶Σ�������Ҳ��Ӧ���٣�Ϊ���������ơ��������Ѿ��ָ������ˣ�ȥ����������°ɣ���Ҫ�ķ��˹�����")

		AddNumText(sceneId, x211042_g_ScriptId,"���ҽ�ȥ",9,13);
		AddNumText(sceneId, x211042_g_ScriptId,"����ȥ����",9,14);
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	
	--20100414 ModifyCodeBegin ��������Ѫ��ħ����Ҫ�ָ��ķ�֧����������ԭ������Ѫ��ħ���ָܻ��Ĵ���
	--EndEvent(sceneId)
	--DispatchEventList(sceneId,selfId,targetId)	
	
	local mp = 0;
	local hp = 0;
	
	hp = RestoreHp(sceneId, selfId)
	mp = RestoreMp(sceneId, selfId)
	
	if( hp == 0 or mp == 0 ) then
	BeginEvent(sceneId)
		strText = "��ȫ��ָ��˽���"
		AddText(sceneId,strText);
	EndEvent(sceneId)
	else 
	BeginEvent(sceneId)
		strText = "��ܽ���������Ҫ�ָ�"
		AddText(sceneId,strText);
	EndEvent(sceneId)
	end
	DispatchMissionTips(sceneId,selfId)
	--20100414 ModifyCodeEnd
end



--**********************************

--�о��¼�

--**********************************

function x211042_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211042_g_ScriptId, x211042_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211042_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211042_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211042_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211042_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211042_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211042_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211042_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211042_OnItemChanged(sceneId, selfId, itemdataId)

end