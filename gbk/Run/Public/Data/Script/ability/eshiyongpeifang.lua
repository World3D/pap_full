--ʹ���䷽�Ľű�

--�ű���
x713501_g_scriptId = 713501

x713501_g_RecipeItems = {}

-- ItemTable ��Ϊ����

-- abilityId: �������Ӧ����
-- recipeId: ѧϰ�Ķ�Ӧ�䷽��
-- needLevel: ѧϰ���䷽��Ҫ����Ӧ����ܼ���
-- specialEffectID: ��Ч��

ZhuZao  = 4
ZhiYi   = 5
GongYi  = 6
PengRen = 7

x713501_g_RecipeItems[	12040011	] = { abilityId = ZhuZao, recipeId =	1	, needLevel =	1	, specialEffectID =	18	}
x713501_g_RecipeItems[	12040012	] = { abilityId = ZhuZao, recipeId =	2	, needLevel =	1	, specialEffectID =	18	}


x713501_g_RecipeItems[	12040012	] = { abilityId = ZhiYi, recipeId =	3	, needLevel =	1	, specialEffectID =	18	}
x713501_g_RecipeItems[	12040012	] = { abilityId = ZhiYi, recipeId =	4	, needLevel =	1	, specialEffectID =	18	}

x713501_g_RecipeItems[	12040013	] = { abilityId = GongYi, recipeId =	5	, needLevel =	1	, specialEffectID =	18	}
x713501_g_RecipeItems[	12040013	] = { abilityId = GongYi, recipeId =	6	, needLevel =	1	, specialEffectID =	18	}

x713501_g_RecipeItems[	12040014	] = { abilityId = PengRen, recipeId =	7	, needLevel =	1	, specialEffectID =	18	}
x713501_g_RecipeItems[	12040014	] = { abilityId = PengRen, recipeId =	8	, needLevel =	1	, specialEffectID =	18	}


--**********************************
-- ͨ�ò��֣�ʹ���䷽������ 1 ��ʾѧ��
--**********************************
function x713501_ReadRecipe( sceneId, selfId, recipeIndex )
	local RecipeFlag = IsPrescrLearned( sceneId, selfId, recipeIndex )

	if RecipeFlag < 1 then
	-- û��ѧ��
		SetPrescription( sceneId, selfId, recipeIndex, 1 )
		Msg2Player( sceneId, selfId, "��ѧ��һ���µ��䷽", MSG2PLAYER_PARA )
		return 1
	else
	-- ��ѧ��
	-- Ŀǰ SetPrescription �Ǹ�˫���أ�ѧ�����ٵ��û���������ǲ��ݻ��䷽ʵ�塣����ʹ��
		Msg2Player( sceneId, selfId, "���䷽��ѧ��", MSG2PLAYER_PARA )
		return 0
	end

	return 0
end

--**********************************
-- ����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0��ִ�� OnDefaultEvent��
--**********************************
function x713501_IsSkillLikeScript( sceneId, selfId )
	return 1
end

--**********************************
-- ����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x713501_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
-- ���������ڣ�����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x713501_OnConditionCheck( sceneId, selfId )
	-- У��ʹ�õ���Ʒ
	if LuaFnVerifyUsedItem( sceneId, selfId ) ~= 1 then
		return 0
	end

	-- �ҵ��䷽��Ŀ
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local recipeItem = x713501_g_RecipeItems[itemTblIndex]
	if not recipeItem then
		return
	end

	local AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, recipeItem.abilityId )
	--������ܲ���ʹ��Ҫ��
	if AbilityLevel < recipeItem.needLevel then
		x713501_NotifyFailTips( sceneId, selfId, "���ܵȼ�����" )
		return 0
	end

	if LuaFnIsPrescrLearned( sceneId, selfId, recipeItem.recipeId ) > 0 then
		x713501_NotifyFailTips( sceneId, selfId, "����䷽�Ѿ�ѧ����" )
		return 0
	end

	return 1
end

--**********************************
--���ļ�⼰������ڣ��������ĵļ���ִ�У�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x713501_OnDeplete( sceneId, selfId )
	if LuaFnDepletingUsedItem( sceneId, selfId ) > 0 then
		return 1
	end

	return 0
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x713501_OnActivateOnce( sceneId, selfId )
	-- �ҵ��䷽��Ŀ
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local recipeItem = x713501_g_RecipeItems[itemTblIndex]
	if not recipeItem then
		return 0
	end

	-- ����ͨ���䷽ѧϰ
	x713501_ReadRecipe( sceneId, selfId, recipeItem.recipeId )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, recipeItem.specialEffectID, 0 )
	return 1
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�������ʱ��Ч�����
--**********************************
function x713501_OnActivateEachTick( sceneId, selfId )
	return 1
end

--**********************************
-- ��Ŀʧ����ʾ
--**********************************
function x713501_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
